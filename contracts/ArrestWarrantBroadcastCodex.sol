// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrestWarrantBroadcastCodex {
    address public admin;

    struct WarrantNotice {
        string suspectName;
        string warrantType;
        string broadcastChannel;
        string emotionalTag;
        bool aired;
    }

    WarrantNotice[] public notices;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitNotice(string memory suspectName, string memory warrantType, string memory broadcastChannel, string memory emotionalTag) external onlyAdmin {
        notices.push(WarrantNotice(suspectName, warrantType, broadcastChannel, emotionalTag, false));
    }

    function airNotice(uint256 index) external onlyAdmin {
        notices[index].aired = true;
    }

    function getNotice(uint256 index) external view returns (WarrantNotice memory) {
        return notices[index];
    }
}
