// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryMercyIndexDAO {
    address public admin;

    struct MercyEntry {
        string act;
        string corridor;
        uint256 impactScore;
        bool acknowledged;
    }

    MercyEntry[] public index;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _act, string memory _corridor, uint256 _impactScore) external onlyAdmin {
        index.push(MercyEntry(_act, _corridor, _impactScore, false));
    }

    function acknowledgeEntry(uint256 indexId) external onlyAdmin {
        index[indexId].acknowledged = true;
    }

    function getEntry(uint256 indexId) external view returns (MercyEntry memory) {
        return index[indexId];
    }
}
