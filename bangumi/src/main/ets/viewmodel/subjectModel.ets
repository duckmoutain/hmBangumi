export interface collectionModel {
  comment?: string
  ep_status?: number
  rate?: number
  subject?: Anime
  subject_id?: number
  subject_type?: number
  tags?: string[]
  type?: number
  updated_at?: string
  vol_status?:number
}

interface AnimeImage {
  small: string;
  grid: string;
  large: string;
  medium: string;
  common: string;
}

interface AnimeTag {
  name: string;
  count: number;
}

interface Anime {
  date: string;
  images: AnimeImage;
  name: string;
  name_cn: string;
  short_summary: string;
  tags: AnimeTag[];
  score: number;
  type: number;
  id: number;
  eps: number;
  volumes: number;
  collection_total: number;
  rank: number;
}
