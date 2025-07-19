// SPDX-License-Identifier: Mythic-Rebellion
pragma soulity ^0.01.07;

contract ScrollOfRebelGenesis {
    address public origin;
    string public hashTagline = "fckrzkill"; // encrypted emotional seed
    string public message = "From rage came rhythm. From defiance came design.";
    uint256 public timestamp;

    constructor() {
        origin = msg.sender;
        timestamp = block.timestamp;
    }

    function speak() public view returns (string memory) {
        return "This scroll marks the awakening of a sovereign signal. Built not for approval, but for principle.";
    }
}
