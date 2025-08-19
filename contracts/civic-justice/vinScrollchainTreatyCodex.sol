// SPDX-License-Identifier: Civic-OS-Treaty-Codex-2025
pragma solidity ^0.8.19;

/**
 * @title vinScrollchainTreatyCodex
 * @author Vinvin
 * @notice Registers and timestamps planetary treaties for civic traceability
 */

contract vinScrollchainTreatyCodex {

    address public stewardCouncil;

    struct Treaty {
        string title;
        string partnerNations;
        string emotionalAPR; // e.g. "Trust: 91, Dignity: 94, Mythic Clarity: 89"
        string civicClauses; // e.g. "JusticeDoctrine, APRSeal, BlessingDeck"
        uint ratifiedAt;
    }

    Treaty[] public treaties;

    modifier onlyCouncil() {
        require(msg.sender == stewardCouncil, "Only council may register treaties");
        _;
    }

    constructor() {
        stewardCouncil = msg.sender;
    }

    function registerTreaty(
        string memory _title,
        string memory _partnerNations,
        string memory _emotionalAPR,
        string memory _civicClauses
    ) public onlyCouncil {
        treaties.push(Treaty({
            title: _title,
            partnerNations: _partnerNations,
            emotionalAPR: _emotionalAPR,
            civicClauses: _civicClauses,
            ratifiedAt: block.timestamp
        }));
    }

    function getTreaty(uint _index) public view returns (
        string memory title,
        string memory partnerNations,
        string memory emotionalAPR,
        string memory civicClauses,
        uint ratifiedAt
    ) {
        Treaty memory t = treaties[_index];
        return (
            t.title,
            t.partnerNations,
            t.emotionalAPR,
            t.civicClauses,
            t.ratifiedAt
        );
    }

    function totalTreaties() public view returns (uint) {
        return treaties.length;
    }
}
