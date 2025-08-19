// SPDX-License-Identifier: Mythic-Open-Source
pragma scrollchain ^7.0.0;

contract vinPrivacyBroadcast {
    address public steward;
    string public broadcastMessage;
    string public civicProtocol;
    bool public isActive;

    event BroadcastActivated(string message, string protocol);
    event BroadcastUpdated(string newMessage);

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized scrollsmith");
        _;
    }

    constructor(string memory message, string memory protocol) {
        steward = msg.sender;
        broadcastMessage = message;
        civicProtocol = protocol;
        isActive = true;
        emit BroadcastActivated(message, protocol);
    }

    function updateBroadcast(string memory newMessage) public onlySteward {
        broadcastMessage = newMessage;
        emit BroadcastUpdated(newMessage);
    }

    function deactivateBroadcast() public onlySteward {
        isActive = false;
    }

    function getBroadcast() public view returns (string memory, string memory, bool) {
        return (broadcastMessage, civicProtocol, isActive);
    }
}
