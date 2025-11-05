// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EcoParkAncestralNourishmentCodex {
    address public steward;

    struct NourishmentClause {
        string ecoParkName;
        string ancestralWisdom;
        string nourishmentProtocol;
        string emotionalTag;
    }

    NourishmentClause[] public codex;

    event AncestralNourishmentTagged(string ecoParkName, string ancestralWisdom, string nourishmentProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagNourishment(
        string memory ecoParkName,
        string memory ancestralWisdom,
        string memory nourishmentProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(NourishmentClause(ecoParkName, ancestralWisdom, nourishmentProtocol, emotionalTag));
        emit AncestralNourishmentTagged(ecoParkName, ancestralWisdom, nourishmentProtocol, emotionalTag);
    }
}
