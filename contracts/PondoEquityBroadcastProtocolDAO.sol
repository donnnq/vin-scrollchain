// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PondoEquityBroadcastProtocolDAO {
    address public admin;

    struct BroadcastEntry {
        string barangay;
        string fundAllocation;
        string equityStatus;
        string emotionalTag;
        bool published;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _barangay, string memory _fundAllocation, string memory _equityStatus, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_barangay, _fundAllocation, _equityStatus, _emotionalTag, false));
    }

    function publishBroadcast(uint256 index) external onlyAdmin {
        broadcasts[index].published = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
