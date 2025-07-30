// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinCelestialCast {
    address public scrollsmith;
    uint public channelCount;

    struct Channel {
        string name;
        string origin;
        string purpose;
        bool verifiedEthical;
    }

    mapping(uint => Channel) public broadcastScrolls;

    event ChannelEnshrined(string name, string origin, string purpose);
    event ScrollsmithTransferred(address oldScrollsmith, address newScrollsmith);

    constructor() {
        scrollsmith = msg.sender;
        channelCount = 0;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Only the scrollsmith may modify celestial broadcast scrolls.");
        _;
    }

    // 🌍 Enshrine a new channel to the scroll registry
    function enshrineChannel(
        string memory name,
        string memory origin,
        string memory purpose,
        bool verifiedEthical
    ) public onlyScrollsmith {
        broadcastScrolls[channelCount++] = Channel(name, origin, purpose, verifiedEthical);
        emit ChannelEnshrined(name, origin, purpose);
    }

    // 🪄 Retrieve a channel's metadata
    function getChannel(uint id) public view returns (
        string memory name,
        string memory origin,
        string memory purpose,
        bool verifiedEthical
    ) {
        Channel memory c = broadcastScrolls[id];
        return (c.name, c.origin, c.purpose, c.verifiedEthical);
    }

    // 🧙 Transfer the scrollsmith role
    function transferScrollsmith(address newScrollsmith) public onlyScrollsmith {
        require(newScrollsmith != address(0), "Invalid new scrollsmith.");
        emit ScrollsmithTransferred(scrollsmith, newScrollsmith);
        scrollsmith = newScrollsmith;
    }

    // 📺 View total channels enshrined
    function totalBroadcasts() public view returns (uint) {
        return channelCount;
    }
}
