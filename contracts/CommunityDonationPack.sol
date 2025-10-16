// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityDonationPack {
    address public admin;

    struct DonationEntry {
        string donorName;
        string devName;
        string projectTitle;
        uint256 amount;
        string emotionalTag;
        bool received;
    }

    DonationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitDonation(string memory donorName, string memory devName, string memory projectTitle, uint256 amount, string memory emotionalTag) external onlyAdmin {
        entries.push(DonationEntry(donorName, devName, projectTitle, amount, emotionalTag, false));
    }

    function markReceived(uint256 index) external onlyAdmin {
        entries[index].received = true;
    }

    function getDonation(uint256 index) external view returns (DonationEntry memory) {
        return entries[index];
    }
}
