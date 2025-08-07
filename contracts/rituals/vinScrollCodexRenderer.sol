// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Scroll Codex Renderer
/// @notice Visualizes Vinvin's scroll suite with purpose and resonance
contract vinScrollCodexRenderer {
    address public creator;
    string public codexName = "Vinvin's Scroll Codex Renderer";

    struct Scroll {
        string name;
        string purpose;
        string resonance;
        address contractAddress;
        uint registeredAt;
    }

    Scroll[] public scrolls;

    event ScrollRegistered(string name, string resonance, address indexed contractAddress);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can render the codex");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function registerScroll(
        string memory _name,
        string memory _purpose,
        string memory _resonance,
        address _contractAddress
    ) public onlyCreator {
        scrolls.push(Scroll(_name, _purpose, _resonance, _contractAddress, block.timestamp));
        emit ScrollRegistered(_name, _resonance, _contractAddress);
    }

    function getAllScrolls() public view returns (Scroll[] memory) {
        return scrolls;
    }
}
