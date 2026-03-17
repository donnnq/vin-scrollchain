// GlobalJusticeResonanceDAO.sol
pragma solidity ^0.8.0;

contract GlobalJusticeResonanceDAO {
    struct Initiative {
        uint256 id;
        string program;     // e.g. "Climate Justice Charter"
        string resonance;   // e.g. "Align governance with global fairness"
        bool active;
    }

    uint256 public initiativeCount;
    mapping(uint256 => Initiative) public initiatives;

    event InitiativeActivated(uint256 id, string program, string resonance);

    function activateInitiative(string memory program, string memory resonance) public {
        initiativeCount++;
        initiatives[initiativeCount] = Initiative(initiativeCount, program, resonance, true);
        emit InitiativeActivated(initiativeCount, program, resonance);
    }
}
