// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Policy Rewrite Protocol v1.0
/// @notice Emotionally tagged smart contract for steward-authorized policy edits and communal restoration

contract PolicyRewriteProtocol {
    address public owner;
    mapping(address => bool) public authorizedEditors;

    struct Policy {
        string title;
        string content;
        uint256 timestamp;
        address author;
    }

    Policy[] public policies;

    event PolicyDeployed(uint256 indexed policyId, string title, address author);
    event PolicyRewritten(uint256 indexed policyId, string newTitle, address editor);

    constructor() {
        owner = msg.sender;
    }

    /// @notice Grant edit permission to a steward
    function authorizeEditor(address steward) external {
        require(msg.sender == owner, "Only owner can authorize");
        authorizedEditors[steward] = true;
    }

    /// @notice Revoke edit permission
    function revokeEditor(address steward) external {
        require(msg.sender == owner, "Only owner can revoke");
        authorizedEditors[steward] = false;
    }

    /// @notice Deploy a new policy
    function deployPolicy(string memory title, string memory content) external {
        policies.push(Policy({
            title: title,
            content: content,
            timestamp: block.timestamp,
            author: msg.sender
        }));
        emit PolicyDeployed(policies.length - 1, title, msg.sender);
    }

    /// @notice Rewrite an existing policy
    function rewritePolicy(uint256 policyId, string memory newTitle, string memory newContent) external {
        require(authorizedEditors[msg.sender], "Not authorized to rewrite");
        require(policyId < policies.length, "Invalid policy ID");

        policies[policyId].title = newTitle;
        policies[policyId].content = newContent;
        policies[policyId].timestamp = block.timestamp;
        policies[policyId].author = msg.sender;

        emit PolicyRewritten(policyId, newTitle, msg.sender);
    }

    /// @notice Emotional tags for rewrite rituals
    function emotionalTags() external pure returns (string memory tags) {
        return "🧭 Restoration, 🌱 Empowerment, 🔥 Deterrence, 🛡️ Sovereignty";
    }
}
