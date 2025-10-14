// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayAIHelperCodexDAO {
    address public admin;

    struct HelperEntry {
        string barangay;
        string helperType;
        string deploymentTask;
        string emotionalTag;
        bool operational;
    }

    HelperEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerHelper(string memory _barangay, string memory _helperType, string memory _deploymentTask, string memory _emotionalTag) external onlyAdmin {
        codex.push(HelperEntry(_barangay, _helperType, _deploymentTask, _emotionalTag, false));
    }

    function activateHelper(uint256 index) external onlyAdmin {
        codex[index].operational = true;
    }

    function getHelper(uint256 index) external view returns (HelperEntry memory) {
        return codex[index];
    }
}
