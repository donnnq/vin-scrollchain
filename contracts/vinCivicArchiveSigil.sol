// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinCivicArchiveSigil.sol
/// @notice Encodes civic events into symbolic sigils for archival and ritual reflection.

contract vinCivicArchiveSigil {
    address public archivist;

    struct Sigil {
        string glyph;
        string originScroll;
        string civicTheme;
        string impactStatement;
        uint256 timestamp;
        address inscribedBy;
    }

    Sigil[] private archive;

    event SigilInscribed(
        string indexed glyph,
        string indexed civicTheme,
        address indexed inscribedBy,
        string originScroll,
        string impactStatement
    );

    modifier onlyArchivist() {
        require(msg.sender == archivist, "Unauthorized archivist");
        _;
    }

    constructor() {
        archivist = msg.sender;
    }

    function inscribeSigil(
        string memory glyph,
        string memory originScroll,
        string memory civicTheme,
        string memory impactStatement
    ) public onlyArchivist {
        archive.push(Sigil({
            glyph: glyph,
            originScroll: originScroll,
            civicTheme: civicTheme,
            impactStatement: impactStatement,
            timestamp: block.timestamp,
            inscribedBy: msg.sender
        }));

        emit SigilInscribed(glyph, civicTheme, msg.sender, originScroll, impactStatement);
    }

    function viewSigil(uint256 index) public view returns (Sigil memory) {
        require(index < archive.length, "Sigil index out of bounds");
        return archive[index];
    }

    function archiveLength() public view returns (uint256) {
        return archive.length;
    }
}
