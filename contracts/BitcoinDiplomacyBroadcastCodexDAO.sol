// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BitcoinDiplomacyBroadcastCodexDAO {
    address public admin;

    struct BroadcastEntry {
        string country;
        string diplomaticMessage;
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

    function submitBroadcast(string memory _country, string memory _diplomaticMessage, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        codex.push(BroadcastEntry(_country, _diplomaticMessage, _platform, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        codex[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return codex[index];
    }
}
