// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VictoryBroadcastCodexDAO {
    address public admin;

    struct Broadcast {
        string caseName;
        string claimantName;
        string lawyerName;
        string platform;
        string emotionalTag;
        bool published;
    }

    Broadcast[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _caseName, string memory _claimantName, string memory _lawyerName, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(Broadcast(_caseName, _claimantName, _lawyerName, _platform, _emotionalTag, false));
    }

    function publishBroadcast(uint256 index) external onlyAdmin {
        broadcasts[index].published = true;
    }

    function getBroadcast(uint256 index) external view returns (Broadcast memory) {
        return broadcasts[index];
    }
}
