// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title VINVIN's Layer2 Minimalism Manifest
/// @notice Registry contract that tracks soulchain-aligned L2s built with minimalist sequencing logic

contract vin_scrollLayer2MinimalismRegistry {
    struct L2Sigil {
        string name;
        address sequencer;
        address prover;
        bool zkCompatible;
        string mood;
    }

    mapping(bytes32 => L2Sigil) public registry;

    event MinimalismSigilLogged(
        bytes32 indexed scrollId,
        string name,
        address indexed sequencer,
        address prover,
        bool zkCompatible,
        string mood
    );

    function logL2Sigil(
        string calldata name,
        address sequencer,
        address prover,
        bool zkCompatible,
        string calldata mood
    ) external {
        bytes32 scrollId = keccak256(abi.encode(name, sequencer, block.timestamp));
        registry[scrollId] = L2Sigil(name, sequencer, prover, zkCompatible, mood);
        emit MinimalismSigilLogged(scrollId, name, sequencer, prover, zkCompatible, mood);
    }

    function getSigil(bytes32 scrollId) external view returns (L2Sigil memory) {
        return registry[scrollId];
    }
}
