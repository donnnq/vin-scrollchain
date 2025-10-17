// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisasterResponseFellowship {
    address public admin;

    struct ResponseEntry {
        string purokName;
        string responseType;
        string emotionalTag;
        bool initiated;
        bool reinforced;
    }

    ResponseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateResponse(string memory purokName, string memory responseType, string memory emotionalTag) external onlyAdmin {
        entries.push(ResponseEntry(purokName, responseType, emotionalTag, true, false));
    }

    function reinforceResponse(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getResponse(uint256 index) external view returns (ResponseEntry memory) {
        return entries[index];
    }
}
