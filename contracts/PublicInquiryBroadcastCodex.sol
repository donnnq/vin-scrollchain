// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicInquiryBroadcastCodex {
    address public admin;

    struct InquiryEntry {
        string inquiryLabel;
        string broadcastMessage;
        string emotionalTag;
        bool aired;
    }

    InquiryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitInquiry(string memory inquiryLabel, string memory broadcastMessage, string memory emotionalTag) external onlyAdmin {
        entries.push(InquiryEntry(inquiryLabel, broadcastMessage, emotionalTag, false));
    }

    function airInquiry(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function getInquiry(uint256 index) external view returns (InquiryEntry memory) {
        return entries[index];
    }
}
