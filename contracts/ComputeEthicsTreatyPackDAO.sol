// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ComputeEthicsTreatyPackDAO {
    address public admin;

    struct TreatyEntry {
        string treatyLabel;
        string ethicsClause;
        string emotionalTag;
        bool ratified;
    }

    TreatyEntry[] public treaties;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _treatyLabel, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        treaties.push(TreatyEntry(_treatyLabel, _ethicsClause, _emotionalTag, false));
    }

    function ratifyTreaty(uint256 index) external onlyAdmin {
        treaties[index].ratified = true;
    }

    function getTreaty(uint256 index) external view returns (TreatyEntry memory) {
        return treaties[index];
    }
}
