// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinPeacekeeperCounterSpeech
/// @notice Tracks speech accountability and enforces pre-thought before rant; supports dignified counters
contract vinPeacekeeperCounterSpeech {
    address public scrollkeeper;

    struct RantLog {
        bool triggered;
        bool reviewed;
        bool countered;
        string rantText;
        string counterResponse;
    }

    mapping(address => RantLog) public logs;

    event RantFiled(address indexed ranter, string rantText);
    event RantReviewed(address indexed ranter);
    event RantCountered(address indexed ranter, string counterResponse);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Scroll reject: Only peacekeeper");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    /// @notice Peacekeeper files a rant before any public outburst
    function fileRant(address user, string calldata rantText) external onlyScrollkeeper {
        logs[user] = RantLog({
            triggered: true,
            reviewed: false,
            countered: false,
            rantText: rantText,
            counterResponse: ""
        });
        emit RantFiled(user, rantText);
    }

    /// @notice Mark the rant as reviewed—prompting reflection before reaction
    function reviewRant(address user) external onlyScrollkeeper {
        RantLog storage log = logs[user];
        require(log.triggered, "No rant filed");
        require(!log.reviewed, "Already reviewed");
        log.reviewed = true;
        emit RantReviewed(user);
    }

    /// @notice Deploy a measured counter-response after review
    function counterRant(address user, string calldata response) external onlyScrollkeeper {
        RantLog storage log = logs[user];
        require(log.triggered, "No rant filed");
        require(log.reviewed, "Rant not reviewed yet");
        require(!log.countered, "Already countered");
        log.countered = true;
        log.counterResponse = response;
        emit RantCountered(user, response);
    }

    /// @notice Fetch rant lifecycle status and texts
    function getRantLog(address user)
        external
        view
        returns (
            bool triggered,
            bool reviewed,
            bool countered,
            string memory rantText,
            string memory counterResponse
        )
    {
        RantLog storage log = logs[user];
        return (log.triggered, log.reviewed, log.countered, log.rantText, log.counterResponse);
    }
}
