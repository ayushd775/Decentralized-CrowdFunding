# **Decentralized Crowdfunding Project**

This project implements a decentralized crowdfunding smart contract using Solidity and Remix IDE. It allows anyone to create a crowdfunding campaign, where contributors can send **Ether**s to the campaign. These ethers can later be refunded if the funding target amount is not reached within the specified deadline.

## **Features**

- **Decentralized:** Utilizes smart contracts on the **EVM**-based blockchain, eliminating the need for intermediaries.
- **Transparency:** All transactions and campaign details are publicly verifiable on the blockchain.
- **Voting:** Voting from all contributors will take place for every fund transfer towards a campaign.
- **Contributors Approval:** If the manager of the fund wants to send ethers to a campaign, manager needs to get more than atleast 50% of votes in favour. 

## **Getting Started**

To deploy your own instance of the crowdfunding smart contract using Remix IDE, follow these steps:

1. Open Remix IDE ([https://remix.ethereum.org/](https://remix.ethereum.org/)) in your web browser.
2. Create a new Solidity file or import the crowdfunding.sol file.
3. Compile the smart contract by selecting the appropriate compiler version and clicking on the "Compile" button.
4. Deploy the compiled smart contract to an Ethereum network or any testnet of your choice.
5. Interact with the deployed contract through Remix IDE.

## **Contributing**

Contributions are welcome! If you find any bugs or have suggestions for improvements, please open an issue or submit a pull request.

## **License**

This project is licensed under the [MIT License](LICENSE).
