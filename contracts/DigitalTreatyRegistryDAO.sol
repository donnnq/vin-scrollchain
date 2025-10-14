// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalTreatyRegistryDAO {
    address public admin;

    struct Treaty {
        string treatyName;
        string partiesInvolved;
        string digitalClause;
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

    function submitTreaty(string memory _treatyName, string memory _partiesInvolved, string memory _digitalClause, string memory _emotionalTag) external onlyAdmin {
        registry.push(Treaty(_treatyName, _partiesInvolved, _digitalClause, _emotionalTag, false));
    }

    function ratifyTreaty(uint256 index) external onlyAdmin {
        registry[index].ratified = true;
    }

    function getTreaty(uint256 index) external view returns (Treaty memory) {
        return registry[index];
    }
}
