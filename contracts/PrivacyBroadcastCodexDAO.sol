// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrivacyBroadcastCodexDAO {
    address public admin;

    struct BroadcastEntry {
        string speaker;
        string privacyMessage;
        string platform;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _speaker, string memory _privacyMessage, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        codex.push(BroadcastEntry(_speaker, _privacyMessage, _platform, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        codex[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return codex[index];
    }
}
