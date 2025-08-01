contract vinScrollEyeWitness {
    struct Report {
        address witness;
        string site;
        string observation;
        bool verified;
    }

    mapping(uint256 => Report) public logs;
    event ReportFiled(uint256 indexed id, string site, bool verified);

    function fileReport(uint256 id, string memory site, string memory observation) public {
        bool legit = bytes(observation).length > 20;
        logs[id] = Report(msg.sender, site, observation, legit);
        emit ReportFiled(id, site, legit);
    }
}
