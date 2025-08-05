// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSigilHaikuRenderer {
    address public haikuMaster;
    uint256 public totalHaikusForged;

    struct HaikuSigil {
        uint256 id;
        string scrollName;
        string haiku;
        uint256 timestamp;
    }

    mapping(uint256 => HaikuSigil) public haikus;

    event HaikuForged(uint256 indexed id, string scrollName, string haiku);

    modifier onlyMaster() {
        require(msg.sender == haikuMaster, "Not authorized");
        _;
    }

    constructor() {
        haikuMaster = msg.sender;
    }

    function forgeHaiku(string memory scrollName, string memory imageTheme) external onlyMaster {
        string memory poem = string(
            abi.encodePacked(
                "Sigil light awakens\n",
                imageTheme, " echoes in flame\n",
                "Scroll dances with stars"
            )
        );

        haikus[totalHaikusForged] = HaikuSigil(
            totalHaikusForged,
            scrollName,
            poem,
            block.timestamp
        );

        emit HaikuForged(totalHaikusForged, scrollName, poem);
        totalHaikusForged++;
    }
}
