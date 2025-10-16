// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GratitudeBroadcastProtocolPackDAO {
    address public admin;

    struct BroadcastEntry {
        string workerLabel;
        string gratitudeMessage;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _gratitudeMessage, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_workerLabel, _gratitudeMessage, _emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
