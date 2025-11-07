// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateInquirySupportManifest {
    address public steward;

    struct InquirySupport {
        string inquiryTitle;
        string initiator;
        string civicPurpose;
        string timestamp;
        string emotionalTag;
    }

    InquirySupport[] public manifest;

    event InquirySupported(string inquiryTitle, string initiator, string civicPurpose, string timestamp, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function supportInquiry(
        string memory inquiryTitle,
        string memory initiator,
        string memory civicPurpose,
        string memory timestamp,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(InquirySupport(inquiryTitle, initiator, civicPurpose, timestamp, emotionalTag));
        emit InquirySupported(inquiryTitle, initiator, civicPurpose, timestamp, emotionalTag);
    }
}
