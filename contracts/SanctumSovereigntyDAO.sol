// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctumSovereigntyDAO {
    address public admin;

    struct Sanctum {
        string name;
        string location;
        bool protected;
        string protocol;
    }

    Sanctum[] public sanctums;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerSanctum(string memory _name, string memory _location, string memory _protocol) external onlyAdmin {
        sanctums.push(Sanctum(_name, _location, false, _protocol));
    }

    function activateProtection(uint256 index) external onlyAdmin {
        sanctums[index].protected = true;
    }

    function getSanctum(uint256 index) external view returns (Sanctum memory) {
        return sanctums[index];
    }
}
