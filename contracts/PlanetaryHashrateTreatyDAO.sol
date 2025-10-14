// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryHashrateTreatyDAO {
    address public admin;

    struct TreatyEntry {
        string country;
        string hashRateCommitment;
        string energyAlignmentClause;
        string emotionalTag;
        bool signed;
    }

    TreatyEntry[] public treaties;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _country, string memory _hashRateCommitment, string memory _energyAlignmentClause, string memory _emotionalTag) external onlyAdmin {
        treaties.push(TreatyEntry(_country, _hashRateCommitment, _energyAlignmentClause, _emotionalTag, false));
    }

    function signTreaty(uint256 index) external onlyAdmin {
        treaties[index].signed = true;
    }

    function getTreaty(uint256 index) external view returns (TreatyEntry memory) {
        return treaties[index];
    }
}
