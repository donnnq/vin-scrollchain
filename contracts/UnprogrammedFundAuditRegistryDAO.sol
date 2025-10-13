// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract UnprogrammedFundAuditRegistryDAO {
    address public steward;

    struct FundEvent {
        string proposalAuthor; // "Diokno", "House Bloc", "Vinvin"
        uint256 fundAmount; // 243200000000
        string fundStatus; // "Retained", "Flagged", "Removed"
        string emotionalTag;
        uint256 timestamp;
    }

    FundEvent[] public events;

    event FundLogged(
        string proposalAuthor,
        uint256 fundAmount,
        string fundStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log unprogrammed fund rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logFund(
        string memory proposalAuthor,
        uint256 fundAmount,
        string memory fundStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(FundEvent({
            proposalAuthor: proposalAuthor,
            fundAmount: fundAmount,
            fundStatus: fundStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit FundLogged(proposalAuthor, fundAmount, fundStatus, emotionalTag, block.timestamp);
    }
}
