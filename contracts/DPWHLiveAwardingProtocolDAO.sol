// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHLiveAwardingProtocolDAO {
    address public admin;

    struct AwardingSession {
        string projectLabel;
        string livestreamLink;
        string emotionalTag;
        bool confirmed;
    }

    AwardingSession[] public sessions;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitSession(string memory projectLabel, string memory livestreamLink, string memory emotionalTag) external onlyAdmin {
        sessions.push(AwardingSession(projectLabel, livestreamLink, emotionalTag, false));
    }

    function confirmSession(uint256 index) external onlyAdmin {
        sessions[index].confirmed = true;
    }

    function getSession(uint256 index) external view returns (AwardingSession memory) {
        return sessions[index];
    }
}
