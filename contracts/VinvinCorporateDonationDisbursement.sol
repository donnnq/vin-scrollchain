// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinvinCorporateDonationDisbursement {
    string public title = "Vinvin–Scrollchain Treaty for Shared Corporate Donation and Community Disbursement Activation";
    string public status = "Scrollchain-sealed, emotionally tagged, generosity-grade";

    uint256 public totalDonation = 500_000_000_000; // 500 billion
    address public steward; // Vinvin's address
    mapping(address => uint256) public companyShares;
    mapping(address => uint256) public communityDisbursement;

    event DonationReceived(address indexed company, uint256 amount);
    event DisbursementExecuted(address indexed recipient, uint256 amount);

    constructor(address _steward) {
        steward = _steward;
    }

    function contribute(address company, uint256 amount) public {
        require(amount > 0, "Donation must be greater than zero");
        companyShares[company] += amount;
        emit DonationReceived(company, amount);
    }

    function disburse(address[] memory recipients, uint256[] memory amounts) public {
        require(msg.sender == steward, "Only steward can disburse");
        require(recipients.length == amounts.length, "Mismatch in recipients and amounts");

        for (uint256 i = 0; i < recipients.length; i++) {
            communityDisbursement[recipients[i]] += amounts[i];
            emit DisbursementExecuted(recipients[i], amounts[i]);
        }
    }

    function getCompanyShare(address company) public view returns (uint256) {
        return companyShares[company];
    }

    function getRecipientDisbursement(address recipient) public view returns (uint256) {
        return communityDisbursement[recipient];
    }
}
