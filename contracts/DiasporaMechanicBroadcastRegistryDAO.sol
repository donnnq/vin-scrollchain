// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaMechanicBroadcastRegistryDAO {
    address public admin;

    struct BroadcastEntry {
        string mechanicName;
        string diasporaRegion;
        string broadcastMessage;
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

    function submitBroadcast(string memory _mechanicName, string memory _diasporaRegion, string memory _broadcastMessage, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_mechanicName, _diasporaRegion, _broadcastMessage, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
