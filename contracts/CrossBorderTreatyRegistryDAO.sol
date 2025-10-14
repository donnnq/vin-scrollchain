// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrossBorderTreatyRegistryDAO {
    address public admin;

    struct Treaty {
        string treatyName;
        string countriesInvolved;
        string corridorActivated;
        string emotionalTag;
        bool ratified;
    }

    Treaty[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _treatyName, string memory _countriesInvolved, string memory _corridorActivated, string memory _emotionalTag) external onlyAdmin {
        registry.push(Treaty(_treatyName, _countriesInvolved, _corridorActivated, _emotionalTag, false));
    }

    function ratifyTreaty(uint256 index) external onlyAdmin {
        registry[index].ratified = true;
    }

    function getTreaty(uint256 index) external view returns (Treaty memory) {
        return registry[index];
    }
}
