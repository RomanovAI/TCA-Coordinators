//
//  MovieService.swift
//  sui
//
//  Created by Артем Романов on 04.03.2023.
//

import ComposableArchitecture

final class MovieService {
    
    static let live = MovieService()
    
    func getMovies() async throws -> [MovieResponseModel]  {
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            return Bool.random() ? getData1() : getData2()
        } catch {
            throw error
        }
    }
    
}

extension MovieService: DependencyKey {
    
    static var liveValue = MovieService.live
    
}

extension DependencyValues {
    
    var movieService: MovieService {
        get { self[MovieService.self] }
        set { self[MovieService.self] = newValue }
    }
    
}

extension MovieService {
    
    private func getData1() -> [MovieResponseModel] {
        [
            .init(
                id: "1",
                name: "zxc",
                description: "sad",
                rating: 5
            ),
            .init(
                id: "2",
                name: "xzczxc",
                description: "sdsvsdvad",
                rating: 3
            ),
            .init(
                id: "3",
                name: "lpkgmfdzxc",
                description: "mdlskbfsad",
                rating: 9
            ),
            .init(
                id: "4",
                name: "mksdjpn mzxc",
                description: "ssavaad",
                rating: 2
            ),
            .init(
                id: "5",
                name: ",msbpjinvmasiokmzxc",
                description: "sadmovsd",
                rating: 7
            ),
            .init(
                id: "35",
                name: "dfvdfb",
                description: "klfd'mhkdlfmhd",
                rating: 5
            )
        ]
    }
    
    private func getData2() -> [MovieResponseModel] {
        [
            .init(
                id: "14",
                name: "fdm.,dsfmbsdbsd",
                description: "sad",
                rating: 5
            ),
            .init(
                id: "25",
                name: "vz, vxm,ksj,mdmvs.,amv sfs",
                description: "sdsvsdvad",
                rating: 3
            ),
            .init(
                id: "43",
                name: "lpkgmfdzxc",
                description: "mdlskbfsad",
                rating: 9
            ),
            .init(
                id: "4",
                name: "asnvakjsvasvavasva mzxc",
                description: "ssavaad",
                rating: 2
            ),
            .init(
                id: "500",
                name: ",kdsanfajksd,fnasf",
                description: "sadmovsd",
                rating: 7
            ),
            .init(
                id: "35",
                name: "dsklfng.vkjd,m/nsdv",
                description: "sad",
                rating: 5
            ),
            .init(
                id: "433",
                name: "asdnfvasv",
                description: "mdlskbfsad",
                rating: 9
            ),
            .init(
                id: "4222",
                name: "cnvmjalskc,l;s.,mdvkals.,vm mzxc",
                description: "ssavaad",
                rating: 2
            ),
            .init(
                id: "104395",
                name: ",ask;fnjknsfasdfawf,fnasf",
                description: "sadmovsd",
                rating: 7
            ),
            .init(
                id: "33",
                name: "adsklfnjaks;kgjnmvalks.,mvas.vkjd,m/nsdv",
                description: "sad",
                rating: 5
            )
        ]
    }
}
