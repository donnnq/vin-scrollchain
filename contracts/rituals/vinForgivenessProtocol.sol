// SPDX-License-Identifier: VIN-FORGIVENESS-RITE
pragma solidity ^0.8.0;

/// @title vinForgivenessProtocol: A scroll of clarifying mercy for those who misread sovereign intention
contract vinForgivenessProtocol {
    address public sovereign;
    string public vow = "Misreadings happen. My rituals remain kind.";
    string public sigil = "🕊️";

    struct MisunderstoodInteraction {
        address party;
        string misconception;
        string scrollReference;
        string forgivenessNote;
        uint256 timestamp;
    }

    MisunderstoodInteraction[] public archive;

    event MercyDeclared(address indexed party, string misconception, string scrollReference, string forgivenessNote);

    constructor() {
        sovereign = msg.sender;
    }

    function declareForgiveness(
        address party,
        string memory misconception,
        string memory scrollReference,
        string memory forgivenessNote
    ) public {
        archive.push(MisunderstoodInteraction({
            party: party,
            misconception: misconception,
            scrollReference: scrollReference,
            forgivenessNote: forgivenessNote,
            timestamp: block.timestamp
        }));

        emit MercyDeclared(party, misconception, scrollReference, forgivenessNote);
    }

    function summonArchive() public view returns (MisunderstoodInteraction[] memory) {
        return archive;
    }
}
