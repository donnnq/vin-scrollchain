// SPDX-License-Identifier: Ripple-Renderer-2025
pragma solidity ^0.8.21;

import "./vinScrollLens.sol"; // assumes vinScrollLens is deployed separately

contract vinScrollLensRenderer {
    vinScrollLens public lens;
    address public scrollkeeper;

    struct RenderedRipple {
        bytes32 fileHash;
        string visualTokenURI;
        uint256 timestamp;
        string metaphor;
    }

    mapping(bytes32 => RenderedRipple[]) public renderedRipples;

    event RippleVisualized(bytes32 indexed fileHash, string tokenURI, string metaphor);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Unauthorized visual aura");
        _;
    }

    constructor(address lensAddress) {
        scrollkeeper = msg.sender;
        lens = vinScrollLens(lensAddress);
    }

    function renderRipple(bytes32 fileHash, string calldata visualTokenURI, string calldata metaphor) external onlyScrollkeeper {
        renderedRipples[fileHash].push(RenderedRipple({
            fileHash: fileHash,
            visualTokenURI: visualTokenURI,
            timestamp: block.timestamp,
            metaphor: metaphor
        }));

        emit RippleVisualized(fileHash, visualTokenURI, metaphor);
    }

    function getRenderings(bytes32 fileHash) external view returns (RenderedRipple[] memory) {
        return renderedRipples[fileHash];
    }
}
