// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StablecoinLogicErrorContainmentProtocol {
    address public admin;

    struct ContainmentEntry {
        string protocolName;
        string errorType;
        string emotionalTag;
        bool contained;
        bool patched;
    }

    ContainmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function containError(string memory protocolName, string memory errorType, string memory emotionalTag) external onlyAdmin {
        entries.push(ContainmentEntry(protocolName, errorType, emotionalTag, true, false));
    }

    function patchError(uint256 index) external onlyAdmin {
        entries[index].patched = true;
    }

    function getContainmentEntry(uint256 index) external view returns (ContainmentEntry memory) {
        return entries[index];
    }
}
