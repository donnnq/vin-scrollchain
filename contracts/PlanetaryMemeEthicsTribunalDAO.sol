// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryMemeEthicsTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string memeLabel;
        string ethicsClause;
        string emotionalTag;
        bool adjudicated;
    }

    TribunalEntry[] public memes;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _memeLabel, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        memes.push(TribunalEntry(_memeLabel, _ethicsClause, _emotionalTag, false));
    }

    function adjudicateEntry(uint256 index) external onlyAdmin {
        memes[index].adjudicated = true;
    }

    function getEntry(uint256 index) external view returns (TribunalEntry memory) {
        return memes[index];
    }
}
