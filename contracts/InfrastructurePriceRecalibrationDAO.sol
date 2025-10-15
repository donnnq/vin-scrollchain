// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructurePriceRecalibrationDAO {
    address public admin;

    struct RecalibrationEntry {
        string projectName;
        uint256 originalPrice;
        uint256 recalibratedPrice;
        string emotionalTag;
        bool approved;
    }

    RecalibrationEntry[] public recalibrations;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRecalibration(string memory _projectName, uint256 _originalPrice, uint256 _recalibratedPrice, string memory _emotionalTag) external onlyAdmin {
        recalibrations.push(RecalibrationEntry(_projectName, _originalPrice, _recalibratedPrice, _emotionalTag, false));
    }

    function approveRecalibration(uint256 index) external onlyAdmin {
        recalibrations[index].approved = true;
    }

    function getRecalibration(uint256 index) external view returns (RecalibrationEntry memory) {
        return recalibrations[index];
    }
}
