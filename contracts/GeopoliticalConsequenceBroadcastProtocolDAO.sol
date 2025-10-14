// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GeopoliticalConsequenceBroadcastProtocolDAO {
    address public admin;

    struct BroadcastEntry {
        string messageTitle;
        string geopoliticalFocus;
        string platform;
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

    function submitBroadcast(string memory _messageTitle, string memory _geopoliticalFocus, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_messageTitle, _geopoliticalFocus, _platform, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
