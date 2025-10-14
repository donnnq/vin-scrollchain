// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayExportSovereigntyDAO {
    address public admin;

    struct ExportEntry {
        string barangay;
        string productType;
        string exportDestination;
        string emotionalTag;
        bool approved;
    }

    ExportEntry[] public exports;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitExport(string memory _barangay, string memory _productType, string memory _exportDestination, string memory _emotionalTag) external onlyAdmin {
        exports.push(ExportEntry(_barangay, _productType, _exportDestination, _emotionalTag, false));
    }

    function approveExport(uint256 index) external onlyAdmin {
        exports[index].approved = true;
    }

    function getExport(uint256 index) external view returns (ExportEntry memory) {
        return exports[index];
    }
}
