contract vinCongressUnmasker {
    struct Senator {
        string name;
        string vote;
        string knownAllegiances;
        bool suspicious;
    }

    mapping(string => Senator) public records;

    function logVote(string memory _name, string memory _vote, string memory _allegiances, bool _suspicious) public {
        records[_name] = Senator(_name, _vote, _allegiances, _suspicious);
    }

    function expose(string memory _name) public view returns (string memory) {
        Senator memory s = records[_name];
        if (s.suspicious) {
            return string(abi.encodePacked("🚨 ", s.name, " flagged for investigation. Vote: ", s.vote, ". Allegiances: ", s.knownAllegiances));
        } else {
            return string(abi.encodePacked("✅ ", s.name, " appears clean. Vote: ", s.vote));
        }
    }
}
