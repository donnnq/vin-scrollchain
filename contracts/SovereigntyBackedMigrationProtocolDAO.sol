// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SovereigntyBackedMigrationProtocolDAO {
    address public admin;

    struct MigrationPath {
        string originCountry;
        string destinationRegion;
        string sovereigntyTag;
        string supportPackage;
        bool activated;
    }

    MigrationPath[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitPath(string memory _originCountry, string memory _destinationRegion, string memory _sovereigntyTag, string memory _supportPackage) external onlyAdmin {
        protocols.push(MigrationPath(_originCountry, _destinationRegion, _sovereigntyTag, _supportPackage, false));
    }

    function activatePath(uint256 index) external onlyAdmin {
        protocols[index].activated = true;
    }

    function getPath(uint256 index) external view returns (MigrationPath memory) {
        return protocols[index];
    }
}
