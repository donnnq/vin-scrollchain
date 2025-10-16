// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PromptBypassAuditCodex {
    address public admin;

    struct BypassAttempt {
        string platformLabel;
        string jailbreakMethod;
        string emotionalTag;
        bool flagged;
    }

    BypassAttempt[] public attempts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAttempt(string memory platformLabel, string memory jailbreakMethod, string memory emotionalTag) external onlyAdmin {
        attempts.push(BypassAttempt(platformLabel, jailbreakMethod, emotionalTag, false));
    }

    function flagAttempt(uint256 index) external onlyAdmin {
        attempts[index].flagged = true;
    }

    function getAttempt(uint256 index) external view returns (BypassAttempt memory) {
        return attempts[index];
    }
}
