// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CeasefireBroadcastOversightDAO {
    address public admin;

    struct BroadcastEntry {
        string region;
        string ceasefireStatus;
        string platform;
        string emotionalTag;
        bool verified;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _region, string memory _ceasefireStatus, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_region, _ceasefireStatus, _platform, _emotionalTag, false));
    }

    function verifyBroadcast(uint256 index) external onlyAdmin {
        broadcasts[index].verified = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
