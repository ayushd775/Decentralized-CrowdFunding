// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CFunding
{
    mapping(address=>uint) public contributors;
    address public manager;
    uint public minContri;
    uint public deadline;
    uint public target;
    uint public raisedAmt;
    uint public NoofContri;

    constructor(uint _target, uint _deadline)
    {
        manager=msg.sender;
        target=_target;
        deadline= block.timestamp+_deadline;
        minContri=100 wei;
    }

    struct Request
    {
        string desc;
        address payable recipient;
        uint value;
        bool completed;
        uint noofVoters;
        mapping(address=>bool) voters;
    }
    mapping (uint=>Request) public request;
    uint public numRequests;

    function sendEth() public payable 
    {
        require(block.timestamp<deadline,"Deadline has passed");
        require(msg.value>=minContri,"Minimun Contribution not met");

        if(contributors[msg.sender]==0)
        {
            NoofContri++;
        }
        contributors[msg.sender]+=msg.value;
        raisedAmt+=msg.value; 
    }

    function getContractBalance() public view returns(uint)
    {
        return address(this).balance;
    }

    function refund() public
    {
        require(block.timestamp>deadline && raisedAmt<target,"You are not eligible for refund");
        require(contributors[msg.sender]>0);
        address payable user= payable(msg.sender);
        user.transfer(contributors[msg.sender]);
        contributors[msg.sender]=0;
    }

    modifier onlymanager
    {
        require(msg.sender==manager, "Only manager can call this function");
        _;
    }

    function createRequest(string memory _description, address payable _recipient, uint _value) public onlymanager
    {
        Request storage newRequest = request[numRequests];
        numRequests++;
        newRequest.desc=_description;
        newRequest.recipient=_recipient;
        newRequest.value=_value;
        newRequest.completed=false;
        newRequest.noofVoters=0;
    }

    function voteRequest(uint _requestNo) public 
    {
        require(contributors[msg.sender]>0,"You mus be a contributor");
        Request storage thisRequest= request[_requestNo];
        require(thisRequest.voters[msg.sender]==false,"You have already voted");
        thisRequest.voters[msg.sender]=true;
        thisRequest.noofVoters++;
    }

    function makePayment(uint _requestNo) public onlymanager
    {
        require(raisedAmt>=target);
        Request storage thisRequest=request[_requestNo];
        require(thisRequest.completed==false,"The request has been completed");
        require(thisRequest.noofVoters>NoofContri/2,"Majority not support");
        thisRequest.recipient.transfer(thisRequest.value);
        thisRequest.completed=true;

    }

}