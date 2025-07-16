// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title VINVIN’s Sigil Bloom
/// @notice Emits on-chain events that front-end can animate as ritual art

contract vin_scrollSigilBloom {
    struct Bloom {
        bytes32 id;
        string glyph;
        uint256 timestamp;
    }

    mapping(bytes32 => Bloom) public blooms;
    event SigilBloomed(bytes32 indexed id, string glyph, uint256 timestamp);

    function bloomSigil(string calldata glyph) external {
        bytes32 id = keccak256(abi.encode(glyph, msg.sender, block.timestamp));
        blooms[id] = Bloom(id, glyph, block.timestamp);
        emit SigilBloomed(id, glyph, block.timestamp);
    }
}
