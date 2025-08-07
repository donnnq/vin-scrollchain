// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Avatar Sigil Renderer
/// @notice Generates symbolic sigils based on trust and delegation status
contract vinAvatarSigilRenderer {
    address public creator;

    struct Sigil {
        string name;
        uint trustPoints;
        bool canExecute;
        string visualSigil;
    }

    mapping(address => Sigil) public sigils;
    address[] public avatarList;

    event SigilUpdated(string name, string visualSigil);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can modify");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function addAvatar(address _avatarAddress, string memory _name) public onlyCreator {
        sigils[_avatarAddress] = Sigil(_name, 0, false, "⛩️ Initiate");
        avatarList.push(_avatarAddress);
    }

    function updateTrust(address _avatarAddress, uint _points, bool _canExecute) public onlyCreator {
        Sigil storage s = sigils[_avatarAddress];
        s.trustPoints += _points;
        s.canExecute = _canExecute;
        s.visualSigil = renderSigil(s.trustPoints, _canExecute);
        emit SigilUpdated(s.name, s.visualSigil);
    }

    function renderSigil(uint _trustPoints, bool _canExecute) internal pure returns (string memory) {
        if (_trustPoints >= 200 && _canExecute) return "🌌 Celestial Executor";
        if (_trustPoints >= 100 && _canExecute) return "🔥 Ascended Delegate";
        if (_trustPoints >= 50) return "🌿 Loyal Flame";
        return "⛩️ Initiate";
    }

    function getSigil(address _avatarAddress) public view returns (Sigil memory) {
        return sigils[_avatarAddress];
    }

    function getAllAvatars() public view returns (address[] memory) {
        return avatarList;
    }
}
