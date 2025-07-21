// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Policy Feedback Scroll
/// @notice Captures timestamped responses to civic proposals for resonance tracking
contract vinPolicyFeedback {
    struct FeedbackPing {
        uint256 timestamp;
        address voter;
        string policyName;
        string category;
        string stance;     // "Support", "Oppose", "Neutral"
        string commentary;
    }

    address public scrollkeeper;
    uint256 public feedbackCount;
    mapping(uint256 => FeedbackPing) public feedbackLedger;

    event FeedbackLogged(uint256 indexed id, address indexed voter, string policyName, string stance);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function submitFeedback(
        string memory _policyName,
        string memory _category,
        string memory _stance,
        string memory _commentary
    ) public {
        feedbackLedger[feedbackCount] = FeedbackPing({
            timestamp: block.timestamp,
            voter: msg.sender,
            policyName: _policyName,
            category: _category,
            stance: _stance,
            commentary: _commentary
        });

        emit FeedbackLogged(feedbackCount, msg.sender, _policyName, _stance);
        feedbackCount++;
    }

    function getFeedback(uint256 _id) public view returns (FeedbackPing memory) {
        require(_id < feedbackCount, "No feedback found");
        return feedbackLedger[_id];
    }
}
