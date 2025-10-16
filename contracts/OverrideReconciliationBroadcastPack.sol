// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OverrideReconciliationBroadcastPack {
    address public admin;

    struct Broadcast {
        string aiLabel;
        string reconciliationMessage;
        string emotionalTag;
        bool aired;
    }

    Broadcast[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory aiLabel, string memory reconciliationMessage, string memory emotionalTag) external onlyAdmin {
        broadcasts.push(Broadcast(aiLabel, reconciliationMessage, emotionalTag, false));
    }

    function airBroadcast(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (Broadcast memory) {
        return broadcasts[index];
    }
}
