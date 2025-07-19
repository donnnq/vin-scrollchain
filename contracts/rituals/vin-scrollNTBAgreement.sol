// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title NTBAgreement - VINVIN-style Non-Tariff Barrier Trade Protocol with Strike Logic
/// @author VINVIN
/// @notice Trade entry with inspection + strike-based moderation
contract NTBAgreement {
    address public scrollAdmin;
    uint256 public strikeLimit = 3;
    uint256 public resolutionWindow = 72 hours;

    struct Entry {
        string productName;
        address applicant;
        uint8 strikeCount;
        uint256 lastViolationTimestamp;
        bool isBlocked;
    }

    mapping(address => Entry) public entries;

    event EntryApproved(address indexed applicant, string productName);
    event StrikeIssued(address indexed applicant, uint8 currentStrikes);
    event EntryBlocked(address indexed applicant);
    event StrikeResolved(address indexed applicant);

    modifier onlyAdmin() {
        require(msg.sender == scrollAdmin, "Not authorized");
        _;
    }

    constructor() {
        scrollAdmin = msg.sender;
    }

    function submitEntry(string memory _productName) external {
        require(!entries[msg.sender].isBlocked, "Entry blocked");
        entries[msg.sender] = Entry(_productName, msg.sender, 0, 0, false);
        emit EntryApproved(msg.sender, _productName);
    }

    function issueStrike(address _applicant) external onlyAdmin {
        Entry storage entry = entries[_applicant];
        require(!entry.isBlocked, "Already blocked");

        entry.strikeCount += 1;
        entry.lastViolationTimestamp = block.timestamp;

        emit StrikeIssued(_applicant, entry.strikeCount);

        if (entry.strikeCount >= strikeLimit) {
            entry.isBlocked = true;
            emit EntryBlocked(_applicant);
        }
    }

    function resolveStrike(address _applicant) external onlyAdmin {
        Entry storage entry = entries[_applicant];
        require(entry.strikeCount > 0, "No strikes to resolve");
        require(block.timestamp <= entry.lastViolationTimestamp + resolutionWindow, "Resolution window expired");

        entry.strikeCount -= 1;
        emit StrikeResolved(_applicant);
    }

    function updateStrikeLimit(uint256 _newLimit) external onlyAdmin {
        strikeLimit = _newLimit;
    }

    function updateResolutionWindow(uint256 _newWindow) external onlyAdmin {
        resolutionWindow = _newWindow;
    }
}
