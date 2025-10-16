// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetarySatireImmunityTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string satireLabel;
        string immunityClause;
        string emotionalTag;
        bool granted;
    }

    TribunalEntry[] public trials;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _satireLabel, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        trials.push(TribunalEntry(_satireLabel, _immunityClause, _emotionalTag, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        trials[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (TribunalEntry memory) {
        return trials[index];
    }
}
