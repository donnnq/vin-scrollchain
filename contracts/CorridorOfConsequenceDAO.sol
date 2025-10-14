// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorridorOfConsequenceDAO {
    address public admin;

    struct Consequence {
        string act;
        string corridor;
        string karmicVerdict;
        bool enforced;
    }

    Consequence[] public consequences;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logConsequence(string memory _act, string memory _corridor, string memory _karmicVerdict) external onlyAdmin {
        consequences.push(Consequence(_act, _corridor, _karmicVerdict, false));
    }

    function enforceConsequence(uint256 index) external onlyAdmin {
        consequences[index].enforced = true;
    }

    function getConsequence(uint256 index) external view returns (Consequence memory) {
        return consequences[index];
    }
}
